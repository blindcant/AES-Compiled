--Login
.logon teradata_server/teradata_user
;
--Change database
DATABASE my_database_name
;
--Drop existing encrypt function and the existing jar file
DROP FUNCTION my_database_name.AES_Encrypt
;
CALL SQLJ.REMOVE_JAR('my_java_file_teradata_name', 0)
;
--Install the jar file
CALL SQLJ.INSTALL_JAR('CJ?C:\path\to\source_code\my_java_file.jar','my_java_file_teradata_name',0)
;
CALL SQLJ.REDISTRIBUTE_JAR('my_java_file_teradata_name')
;
--Create the encrypt function. It should accept unicode (it accepts utf-8 but Java internally is utf-16) and return ASCII (base64).
CREATE FUNCTION my_database_name.AES_Encrypt(plaintext varchar(27000) character set latin, secretKey varchar(32))
RETURNS varchar(13500) character set ASCII
LANGUAGE JAVA
NO SQL
PARAMETER STYLE JAVA
RETURNS NULL ON NULL INPUT
EXTERNAL NAME 'my_java_file_teradata_name:my_java_file_class_name.my_java_file_method_name'
;
--Repeat for the Decrypt function
DROP FUNCTION my_database_name.AES_Decrypt
;
CALL SQLJ.REMOVE_JAR('my_java_file_teradata_name', 0)
;
CALL SQLJ.INSTALL_JAR('CJ?C:\path\to\source_code\my_java_file.jar','my_java_file_teradata_name',0)
;
CALL SQLJ.REDISTRIBUTE_JAR('my_java_file_teradata_name')
;
--It should accept ASCII (base64) and return unicode (it returns utf-8 but Teradata internally is utf-16)
CREATE FUNCTION my_database_name.AES_Decrypt(ciphertext varchar(13500) character set ASCII, secretKey varchar(32))
RETURNS varchar(27000) character set unicode
LANGUAGE JAVA
NO SQL
PARAMETER STYLE JAVA
RETURNS NULL ON NULL INPUT
EXTERNAL NAME 'my_java_file_teradata_name:my_java_file_class_name.my_java_file_method_name'
;
