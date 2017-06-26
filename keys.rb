require_relative 'database'


class Keys 
	def initialize()
		@db = DatabaseKeys.new()
	end

	def criarChave(keyId, desc)
		@db.inserirChave(keyId, desc, "Ninguém")
	end 

	def removerChave(keyId)
		@db.deletarChave(keyId)
	end

	def mostrarChaves()
		@db.listarChaves()
	end

	def darChaves(keyId, people)
		@db.emprestarChave(keyId, people)
	end

end