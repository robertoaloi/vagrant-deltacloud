name              "Apache Deltacloud"
maintainer        "Roberto Aloi"
maintainer_email  "roberto.aloi@erlang-solutions.com"
license           "Apache 2.0"
description       "Installs/configures Apache Deltacloud"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1"
recipe            "deltacloud::default", "Installs/configures Apache Deltacloud"

supports "ubuntu"
supports "debian"
