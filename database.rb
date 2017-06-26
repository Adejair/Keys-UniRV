class DatabaseKeys
	def initialize
		@KEY = 1
		@DESC = 2
		@OCUPADA = 3

		@db = SQLite3::Database.new("data/keys.db")

		@db.execute("create table if not exists keys (
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			key INTEGER, 
			desc TEXT varchar(100),
			ocupada TEXT varchar(30));")

		@insertKey = @db.prepare("insert into keys (key, desc, ocupada) values (?,?,?)")
	end

	def inserirChave(key, desc, ocupada)	
		if !(self.existsKey(key))
			@insertKey.execute(key, desc, ocupada)
			puts ">> Chave Criada"
		else
			puts ">> Chave já cadastrada no sistema"
		end
	end

	def existsKey(keyId)
		@existsKey = @db.execute("select * from keys where key=#{keyId}")
		
		if @existsKey.length > 0
			return true
		else
			return false
		end
	end

	def deletarChave(keyId) 	
		if self.existsKey(keyId)
			@deleted = @db.execute("delete from keys where key = ?", keyId)
			puts ">> Chave deletada"
		else 
			puts ">> Chave não existe"
		end
	end

	def emprestarChave(keyId, people)
		if self.existsKey(keyId)
			@db.execute("update keys set ocupada = ? where key = ?", people, keyId)
			puts "Status da chave atualizada ! " + people
		else
			puts ">> Chave não existe"
		end
	end

	def listarChaves()
		@listKey = @db.execute("select * from keys")

		@listKey.each do |row|
			puts "DESC: " + row[@DESC].to_s + " KEY: " + row[@KEY].to_s + " OCUPADA: " + row[@OCUPADA]
		end
	end	

end