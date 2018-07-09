#ifndef SQL_SERVER_STORAGE_AREA_H
# define SQL_SERVER_STORAGE_AREA_H

#include "orthancsqlserverstorage_export.h"
#include <orthanc/OrthancCPlugin.h>
#include <memory>
#include "SqlServerStorageConnection.h"
#include "SqlServerStorageException.h"

namespace OrthancPlugins
{
  class ORTHANCSQLSERVERSTORAGE_EXPORT SqlServerStorageArea
  {  
    public:
      SqlServerStorageArea(SqlServerStorageConnection* connection);
      ~SqlServerStorageArea();

      /**
       * @brief      creates a data entity in the storage
       *
       * @param[in]  uuid     The uuid
       * @param[in]  content  The content
       * @param[in]  size     The size
       * @param[in]  type     The type
       */
      void Create(const std::string& uuid,
                  const void* content,
                  size_t size,
                  OrthancPluginContentType type);

      /**
       * @brief      reads data from the storage
       *
       * @param      content  The content
       * @param      size     The size
       * @param[in]  uuid     The uuid
       * @param[in]  type     The type
       */
      void Read(void*& content,
                size_t& size,
                const std::string& uuid,
                OrthancPluginContentType type);


      /**
       * @brief      removes data for mthe storage
       *
       * @param[in]  uuid  The uuid
       * @param[in]  type  The type
       */
      void Remove(const std::string& uuid,
                  OrthancPluginContentType type);

    private:
      std::unique_ptr<SqlServerStorageConnection>  m_connection;
  };
}

#endif // SQL_SERVER_STORAGE_AREA_H

