# AES CBC Encryption & Decryption
Compiled jar files for the database UDF and command line version of the AES CBC program. Java 1.8 is required. There are 5 files:
1. AES_CBC_Padding-1.4.jar
2. AES_CBC_Padding_UDF-Both.jar
3. AES_CBC_Padding_UDF-Decrypt.jar
4. AES_CBC_Padding_UDF-Encrypt.jar
5. Teradata_Java_UDF_install.sql

The first file is the CLI version of the program. To run it, go into the command line and type java -jar AES_CBC_Padding-1.4.jar -h to show the program's help. It can do everything from the command line

The following 3 files can also be run from the command line using java -jar AES_CBC_Padding_UDF_xxx.jar but this is for demonstration purposes only. They are to be used as Database User Defined Functions. The file ending with Both can do both encryption and decryption, whereas the other 2 do decryption or encryption only. The method signatures for them are decrypt(String inputCiphertextBase64, String inputKey) and encrypt(String inputCiphertextBase64, String inputKey).

The final file is the file needed to load the UDFs into Teradata. Here are some notes on what the file does.

Basically the code does 6 things
1)	Set the default database.  You want this to be the database the function is being created in.  This setting determines which database the jar gets loaded to.  Even though the jar is not visible as a database object, it’s linked to the default database where its loaded.  If this isn’t done you can get errors relating to the system not being able to find the jar.
2)	Drops the function (if it exists)
3)	Removes the jar (if it exists)
4)	Installs the jar using the name my_java_file_teradata_name.  Make sure the path to the jar file is correct for the system you are installing the jar on
5)	Redistributes the jar.  I don’t think this needs to be done in most cases, but it doesn’t seem to do any harm so I left the code in.
6)	Creates the function
