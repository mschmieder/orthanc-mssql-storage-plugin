#ifndef SQL_SERVER_STORAGE_CONNECTION_H
#define SQL_SERVER_STORAGE_CONNECTION_H

#include "orthancsqlserverstorage_export.h"
#include <stdint.h>
#include <string>

namespace OrthancPlugins
{
  class ORTHANCSQLSERVERSTORAGE_EXPORT SqlServerStorageConnection
  {
    public:
      SqlServerStorageConnection(const std::string& storage_connection_string = "");
      
      SqlServerStorageConnection(const SqlServerStorageConnection& other) = delete;
      ~SqlServerStorageConnection();

      void establishConnection();
      void setConnectionString(const std::string& storage_connection_string);
      void setContainerName(const std::string& container_name);

    private:
      std::string m_storage_connection_string;
  };
}

#endif // SQL_SERVER_STORAGE_CONNECTION_H
