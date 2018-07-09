#ifndef SQL_SERVER_STORAGE_EXCEPTION_H
# define SQL_SERVER_STORAGE_EXCEPTION_H

#include <stdexcept>
#include <string>

namespace OrthancPlugins
{
  class AzureBlobStorageException : public std::runtime_error
  {
    public:
      AzureBlobStorageException(const std::string& message) :
        std::runtime_error("Error in AzureBlobStorage: " + message)  {}
  };
}


#endif // SQL_SERVER_STORAGE_EXCEPTION_H