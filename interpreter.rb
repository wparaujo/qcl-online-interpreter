require 'open3'
require 'psych'

 class Interpreter

  attr_accessor :stdin, :stdout, :stderr, :index_step_command

  def initialize
    self.index_step_command = 0
  end

  def init_qcl
    self.stdin, self.stdout, self.stderr, status, thread = Open3.popen3('qcl')
  end

  def execute_qcl_command(command)
    init_qcl
    self.stdin.puts command
    self.stdin.close
  end

  def edit_output_to_console(output)
    # 1 - Varrer outputs anteriores
    # 2 - Deletar de tal output tudo que tiver nos anteriores
    # 3 - retornar o output editado.
  end
  # Method to parse output to send console
  def create_yaml(command, output)
    self.index_step_command += 1
    step_hash = {"command_step_#{self.index_step_command}" =>
                                    {"command" => command,
                                      "output" => output
                                    }
                }
    yaml = step_hash.to_yaml
  end

  def save_in_historic(yaml)

  end

end
