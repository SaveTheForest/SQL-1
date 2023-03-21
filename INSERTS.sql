#POPULAR TABELAS 
INSERT INTO ambulatorio( nroa, andar, capacidade ) VALUES 
(1, '1', 30),
(2, '1', 50),
(3, '2', 40),
(4, '2', 25),
(5, '2', 55);

INSERT INTO medico( codm, nome, idade, especialidade, cpf, cidade, Ambulatorio_nroa ) VALUES 
(1, 'Joao', 40, 'ortopedia', '10000100000', 'Florianopolis', 1),
(2, 'Maria', 42, 'traumatologia', '10000110000', 'Blumenau', 2),
(3, 'Pedro', 51, 'pediatria', '11000100000', 'São José', 2),
(4, 'Carlos', 28, 'ortopedia', '11000110000', 'Joinville', 1),
(5, 'Marcia', 33, 'neurologia', '11000111000', 'Biguacu', 3);

INSERT INTO paciente( codp, nome, idade, cidade, cpf, doenca ) VALUES 
(1, 'Ana', 20, 'Florianopolis', '20000200000', 'gripe'),
(2, 'Paulo', 24, 'Palhoca', '20000220000', 'fratura'),
(3, 'Lucia', 30, 'Biguacu', '22000200000', 'tendinite'),
(4, 'Carlos', 28, 'Joinville', '11000110000', 'sarampo');

INSERT INTO funcionario( codf, nome, idade, cidade, salario, cpf ) VALUES 
(1, 'Rita', 32, 'Sao Jose', 1200, '20000100000'),
(2, 'Maria', 55, 'Palhoca', 1220, '30000110000'),
(3, 'Caio', 45, 'Florianopolis', 1100, '41000100000'),
(4, 'Carlos', 44, 'Florianopolis', 1200, '51000110000'),
(5, 'Paula', 44, 'Florianopolis', 2500, '61000111000');

INSERT INTO consulta( medico_codm, Paciente_codp, data, hora ) VALUES 
(1, 1, '2006/06/12', '14:00' ),
(1, 4, '2006/06/13', '10:00' ),
(2, 1, '2006/06/13', '9:00' ),
(2, 2, '2006/06/13', '11:00' ),
(2, 3, '2006/06/14', '14:00' ),
(3, 4, '2006/06/19', '13:00' ),
(4, 4, '2006/06/20', '13:00' ),
(4, 4, '2006/06/22', '19:30' );
