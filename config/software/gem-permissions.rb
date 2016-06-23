#
# Copyright 2012-2014 Chef Software, Inc.
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

#
# Use this software definition to fix the gem-permissions on * nix builds.
#

name "gem-permissions"

default_version "0.0.1"

license :project_license

build do
  unless windows?
    block "Fix gem permissions" do
      FileUtils.chmod_R "a+rX", "#{install_dir}/embedded/lib/ruby/gems/"
    end
  end
end
