require 'json'

module UpdateNodeRuntimeKernels
  class Script < ConfCtl::UserScript
    register

    def setup_cli(app)
      app.desc 'Manage node runtime kernel versions'
      app.command 'runtime-kernels' do |rk|
        rk.desc 'Update runtime kernels'
        rk.arg_name '[machine-pattern]'
        rk.command :update do |c|
          c.desc 'Enable traces in Nix'
          c.switch 'show-trace'

          c.desc 'Filter by attribute'
          c.flag %i(a attr), multiple: true

          c.desc 'Filter by tag'
          c.flag %i(t tag), multiple: true

          c.desc 'Assume the answer to confirmations is yes'
          c.switch %w(y yes)

          c.action &ConfCtl::Cli::Command.run(c, RuntimeKernels, :update)
        end
      end
    end
  end

  class RuntimeKernels < ConfCtl::Cli::Cluster
    def update
      require_args!(optional: %w(machine-pattern))

      machines = select_machines(args[0]).select { |_, m| m.spin == 'vpsadminos' }

      ask_confirmation! do
        puts "The following machines will be queried:"
        list_machines(machines)
      end

      saved_kernels = load_json
      results = {}
      errors = {}

      tw = ConfCtl::ParallelExecutor.new(machines.length)

      machines.each do |host, machine|
        tw.add do
          mc = ConfCtl::MachineControl.new(machine)

          begin
            result = mc.execute('uname', '-r')
            results[host] = result
          rescue TTY::Command::ExitError => e
            errors[host] = e
          end
        end
      end

      tw.run

      puts sprintf('%-50s %s', 'HOST', 'KERNEL')

      machines.each do |host, _|
        kernel =
          if results[host]
            results[host].out.strip.split('.')[0..2].join('.')
          else
            'error'
          end

        saved_kernels[host] = kernel if kernel != 'error'
        puts sprintf('%-50s %s', host, kernel)
      end

      if errors.any?
        puts

        errors.each do |host, e|
          puts "Error on #{host}: #{e.message}\n"
          saved_kernels.delete(host)
        end
      end

      save_json(saved_kernels)
    end

    protected
    def load_json
      JSON.parse(File.read(json_path))
    rescue Errno::ENOENT
      {}
    end

    def save_json(kernels)
      File.write(json_path, JSON.pretty_generate(kernels))
    end

    def json_path
      File.join(ConfCtl::ConfDir.path, 'configs/node/kernels.json')
    end
  end
end
