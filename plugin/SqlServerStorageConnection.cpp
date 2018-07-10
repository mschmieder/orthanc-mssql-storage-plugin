#include "SqlServerStorageConnection.h"

namespace OrthancPlugins
{

  SqlServerStorageConnection::SqlServerStorageConnection(const std::string& storage_connection_string)
      : m_storage_connection_string(storage_connection_string)
  {
  }

  SqlServerStorageConnection::~SqlServerStorageConnection()
  {
  }

  void SqlServerStorageConnection::setConnectionString(const std::string& storage_connection_string)
  {
    m_storage_connection_string = storage_connection_string;
  }

  void SqlServerStorageConnection::establishConnection()
  {
      std::string server = "tcp:dbs-always-encrypted.database.windows.net,1433"
      std::string database = "db-encryption"
      std::string username = "stryker@dbs-always-encrypted"
      std::string password = "AlwaysEncrypted_1234"

      std::stringstream connection_string;
      connection_string<<"DRIVER={ODBC Driver 17 for SQL Server};"
        <<"Server="<<server<<";"
        <<"Database="<<database<<";"
        <<"UID="<<username<<";"
        <<"PWD="<<password<<";"
        <<"Encrypt=yes"<<";"
        <<"TrustedConnection=yes"<<";"
        <<"ColumnEncryption=Enabled"<<";"
        <<"KeyStoreAuthentication=KeyVaultClientSecret"<<";"
        <<"KeyStorePrincipalId=1a896e71-8ae0-4666-a6d1-cac05c5de767"<<";"
        <<"KeyStoreSecret=l2c35eXAxAtlNI6S4dJsqQbdMKooM6CyISKspWmJhYI="<<";"
      ]
  }

} // OrthancPlugins
