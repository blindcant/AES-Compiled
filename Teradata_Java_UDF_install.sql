.logon teradata_server/teradata_user,;
database my_database_name ;
drop  FUNCTION my_database_name.MY_FUCTION_NAME;
call sqlj.remove_jar('my_java_file_teradata_name', 0);

 

call sqlj.install_jar('CJ?C:\path\to\source_code\my_java_file.jar','my_java_file_teradata_name',0);

call SQLJ.REDISTRIBUTE_JAR('my_java_file_teradata_name');

 
CREATE FUNCTION my_database_name.MY_FUCTION_NAME (ciphertext varchar(27000) character set latin, iv char(16))
RETURNS varchar(10000) character set unicode
LANGUAGE JAVA
NO SQL
PARAMETER STYLE JAVA
RETURNS NULL ON NULL INPUT
EXTERNAL NAME 'my_java_file_teradata_name:my_java_file_class_name.my_java_file_method_name';
