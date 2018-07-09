#include "SqlServerStorageArea.h"
#include "Configuration.h"
#include <sstream>

namespace OrthancPlugins
{
  SqlServerStorageArea::SqlServerStorageArea(SqlServerStorageConnection* connection)
    : m_connection(connection)
  {
  }

  SqlServerStorageArea::~SqlServerStorageArea()
  {
  }

  void  SqlServerStorageArea::Create(const std::string& uuid,
                                     const void* content,
                                     size_t size,
                                     OrthancPluginContentType type)
  {
  }

  void  SqlServerStorageArea::Read(void*& content,
                                   size_t& size,
                                   const std::string& uuid,
                                   OrthancPluginContentType type)
  {
  }

  void  SqlServerStorageArea::Remove(const std::string& uuid,
                                     OrthancPluginContentType type)
  {
  }

}
