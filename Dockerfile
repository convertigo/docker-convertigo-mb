# Copyright (c) 2001-2019 Convertigo SA.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, see<http://www.gnu.org/licenses/>.

FROM convertigo/convertigo-ci:develop

RUN (curl -sL https://aka.ms/InstallAzureCLIDeb | bash) \
	&& (curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -) \
	&& (echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list) \
	&& apt-get update \
	&& apt-get install -y kubectl \
	&& rm -rf /var/lib/apt/lists/*
