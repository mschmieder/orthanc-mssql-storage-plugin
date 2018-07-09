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
  }

} // OrthancPlugins
