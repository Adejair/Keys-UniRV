require 'sqlite3'

require_relative 'keys'

class Menu 
	def initialize()
		@keys = Keys.new
	end

	def gerarMenu()
		begin
			puts('============================')
			puts('Sistemas de chave - UniRV ')
			puts('============================')

			puts('1 - Cadastrar Chave')
			puts('2 - Destruir Chave')
			puts('3 - Emprestar Chave')
			puts('4 - Devolução de Chave')
			puts('5 - Listar Chaves')
			puts('6 - Sair')

			@option = gets.to_i

			case @option
				when 1 
					puts "Qual o número da sala para a chave? "
					@sala = gets.to_i

					puts "Qual a descrição da sala ?"
					@desc = gets 

					self.clearMenu()
					@keys.criarChave(@sala, @desc)

					self.gerarMenu
				when 2
					puts "Digite o número da sala"
					@keyId = gets.to_i 

					self.clearMenu()
					@keys.removerChave(@keyId)
					self.gerarMenu

				when 3
					puts "Digite o numero da sala"
					@keyId = gets.to_i 

					puts "Digite o nome do professor"
					@professor = gets 

					self.clearMenu()
					@keys.darChaves(@keyId, @professor)

					self.gerarMenu

				when 4 
					puts "Digite a chave da sala para devolver"
					@keyId = gets.to_i 


					self.clearMenu()
					@keys.darChaves(@keyId, "Ninguém")
					self.gerarMenu
				when 5
					self.clearMenu
					@keys.mostrarChaves()
					self.gerarMenu
			end

		end while @option < 1 or @option > 6
	end

	def clearMenu()
		@i = 1
		while @i < 100 do 
			puts " "
			@i += 1
		end 
	end 
end
