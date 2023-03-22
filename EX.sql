SET SQL_SAFE_UPDATES = 0;
#PRIMEIRA PARTE
#3
ALTER TABLE Funcionario ADD nroa int;

#4
alter table medico add index idx_cpf (cpf);
alter table paciente add index idx_doenca (doenca);

#5
DROP INDEX idx_doenca ON paciente;

#6
ALTER TABLE Funcionario DROP COLUMN cargo;
ALTER TABLE Funcionario DROP COLUMN nroa;


#__________________________________________________________________
# 1) O paciente Paulo mudou-se para Ilhota
UPDATE paciente SET cidade = 'Ilhota' WHERE cpf ='20000220000';

# 2) A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Julho de 2006
UPDATE consulta SET  data = '2006/06/04', hora = '12:00' WHERE medico_codm ='1' and paciente_codp = '4';

# 3) A paciente Ana fez aniversário e sua doença agora é cancer
UPDATE paciente SET doenca = 'cancer' WHERE cpf ='20000200000';

#4) A consulta do médico Pedro (codm = 3) com o paciente Carlos (codp = 4) passou para uma hora e meia depois
UPDATE consulta SET hora = ('14:30:00') WHERE medico_codm ='3' and paciente_codp = '4';

#5) O funcionário Carlos (codf = 4) deixou a clinica
DELETE FROM funcionario WHERE codf = 4;

# 6) As consultas marcadas após as 19 horas foram canceladas
DELETE FROM consulta WHERE hora >= "19:00:00";

# 7) Os pacientes com câncer ou idade inferior a 10 anos deixaram a clínica
DELETE FROM paciente WHERE doenca = "cancer" || idade < 10;

#8) Os médicos que residem em Biguacu e Palhoca deixaram a clínica
DELETE FROM medico WHERE cidade = "biguacu" ||cidade = "palhoca";


