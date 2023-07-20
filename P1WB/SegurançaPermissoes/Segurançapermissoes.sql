/** A juste questões de segurança, incluindo usuários, papéis e permissões.
		Para criar um novo usuário, utiliza o seguinte comando:**/
        use datasurgery1;
		CREATE ROLE ' paciente';
        grant select, insert on consulta to 'paciente';
        grant select on disponibilidade to 'paciente';
        
        create role 'funcionario_adm';
        grant select, insert, update, delete on consulta to 'funcionario_adm';
        grant select, insert, update, delete on disponibilidade to 'funcionario_adm';
        
        create role 'medico';
        grant select, insert on consulta to 'medico';
        grant select, insert, update on disponibilidade to 'medico';
        
        create user 'paciente'@'localhost' identified by 'paciente123';
        grant 'paciente' to 'paciente'@'localhost';
        
        create user 'medico'@'localhost' identified by 'medico123';
        grant 'medico' to 'medico'@'localhost';
        
        create user 'funcionario_adm'@'localhost' identified by 'funcionarioadm123';
        grant 'funcionario_adm' to 'funcionario_adm'@'localhost';

/**Crie visões no banco de dados para consultas mais frequentes.**/
		 
	CREATE VIEW view_disponibilidade AS SELECT codigo, datahora, sala_id, consulta_id, MEDICO FROM disponibilidade;
    
    
/**Crie ao menos uma stored function, um stored procedure ou um trigger para o banco de dados, 
			selecionando uma funcionalidade que seja adequada para tanto**/
	DELIMITER //

		CREATE TRIGGER data_alterada AFTER INSERT
 
		ON consulta
 
		FOR EACH ROW
	 
		BEGIN
 
		UPDATE datahora
 
		SET NEW.datahora = valor
 
		WHERE datahora = NEW.datahora;
 
		END// DELIMITER ;

/**Crie ao menos um índice composto para uma das tabelas.**/
 
		CREATE INDEX idx_id ON disponibilidade(datahora, MEDICO);


/**Descreva textualmente uma rotina de administração de banco de dados, prevendo backups,restore e checagem de integridade periódica.**/
		/**RELATORIO DE BACKUP
PLANEJAMENTO DE BACKUP
 Prioridades
o Guardar e proteger dados dos pacientes
o Recuperação do histórico de consultas/cirurgias
 COMO FARIA
o Conecte-se ao banco de dados com o Workbench.
o Clique em Server na barra de ferramentas principal.
o Selecione Data Export.
o Selecione as tabelas das quais deseja fazer o backup.
o Em Export Options, selecione onde você pretende salvar 
o backup (dump). Por padrão, o salvamento fica na 
pasta Documents em uma subpasta chamada dumps.
o Quando o backup for concluído, os arquivos SQL do banco de 
dados estarão salvos na pasta dumps.
 QUANDO FARIA
o O backup seria feito todo dia as 00:00 pm.
 QUEM FARIA
o O funcionário que tem acesso ao usuário funcionario_adm, pois ele 
terá permissão de mexer em tudo.
 SCRIPT LINUX
o #!/bin/sh
o FILE=datasurgery.sql`date +"2023/02%06"`
o DBSERVER=localhost
o DATABASE=database-name
o USER=your-name
o PASS=your-password
o unalias rm 2> /dev/null
o rm ${FILE} 2> /dev/null
o rm ${FILE}.gz 2> /dev/null **/