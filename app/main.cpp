#include "printHello.hpp"
#include "config.hpp"


int main() {
  print printObject;

  std::cout << project_name << " Project Started\n";
  std::cout << "Project Version is: " << project_version << std::endl;

  #if DEBUG_LOG
  std::cout << "#### Print DEBUG_LOG Message" << std::endl;
  #endif

  printObject.printHelloWorld();
  
  return 0;
}