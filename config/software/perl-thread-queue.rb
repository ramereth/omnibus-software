#
# Copyright 2019 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "perl-thread-queue"
default_version "3.13"

dependency "perl"

version "3.13" do
  source md5: "0fada5b474e9c97d6262059cf62cfc88"
end

source url: "http://search.cpan.org/CPAN/authors/id/J/JD/JDHEDDEN/Thread-Queue-#{version}.tar.gz"

relative_path "Thread-Queue-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path).merge(
    "INSTALL_BASE" => "#{install_dir}/embedded"
  )

  command "#{install_dir}/embedded/bin/perl Makefile.PL", env: env

  make env: env
  make "install", env: env
end
