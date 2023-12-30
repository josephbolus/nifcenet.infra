#!/bin/bash

# Author: Joseph Bolus
# Date: 12-12-2023
# Description: Creates ansible role file structure without the extra bloat
# 
# How to use: ./create_role rolename

AUTHOR="Joseph Bolus <jbolus@blm.gov>"

curr_date=$(date '+%b-%m-%Y')
if [[ -z "$1" ]]; then
  read -p "Role name: " role_name
else
  role_name="$1"
fi
mkdir -p ./roles/${role_name}/{meta,tasks,defaults}

sleep 2

cat << EOF > ./roles/${role_name}/meta/main.yml
galaxy_info:
  author: ${AUTHOR}
  description: your role description
  company: National Interagency Fire Center (NIFC) FAIT

  # If the issue tracker for your role is not on github, uncomment the
  # next line and provide a value
  # issue_tracker_url: http://example.com/issue/tracker

  # Choose a valid license ID from https://spdx.org - some suggested licenses:
  # - BSD-3-Clause (default)
  # - MIT
  # - Apache-2.0
  # - CC-BY-4.0
  license: license (GPL-2.0-or-later, MIT, etc)

  min_ansible_version: "2.1"
  # If this a Container Enabled role, provide the minimum Ansible Container version.
  # min_ansible_container_version:


  galaxy_tags: []
    # List tags for your role here, one per line. A tag is a keyword that describes
    # and categorizes the role. Users find roles by searching for tags. Be sure to
    # remove the '[]' above, if you add tags to this list.
    #
    # NOTE: A tag is limited to a single word comprised of alphanumeric characters.
    #       Maximum 20 tags per role.

dependencies: []
  # List your role dependencies here, one per line. Be sure to remove the '[]' above,
  # if you add dependencies to this list.
EOF


cat << EOF > ./roles/${role_name}/README.md
Ansible Role: ${role_name}
=========
A brief description of the role goes here.

Requirements
------------
Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------
A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read >

Dependencies
------------
A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------
Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }
License
-------

MIT/BSD

Author Information
------------------
This role was created on ${curr_date} by ${AUTHOR},
An optional section for the role authors to include contact information, or a website (HTML is not allowed).
EOF

for dir in tasks defaults; do
    cat << EOF > "./roles/${role_name}/${dir}/main.yml"
---
EOF
done


[ $? -eq 0 ] && echo "-> Role $role_name structure successfully!"

echo "-> Modify roles/${role_name}/meta/main.yml as needed."
