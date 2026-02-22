#include <iostream>
#include <string>

#include "absl/strings/escaping.h"

int main() {
  std::string s = "hello";

  std::string out;
  absl::Base64Escape(s, &out);

  std::string inplace = s;
  absl::Base64Escape(inplace, &inplace);

  std::cout << "out_of_place=[" << out << "]\n";
  std::cout << "inplace=[" << inplace << "]\n";
  return 0;
}