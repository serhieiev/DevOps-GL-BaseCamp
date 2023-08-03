# GL Homework 7
## Requirements

```                                                                                                              
ansible core >= 2.11
```

## Task

1. Create and run a script (Ansible playbook) to harden users’ passwords by rejecting the ones that contain a username. Enforce this rule for ‘root’ as well.
2. [Optional] Try to implement the same hardening rule without PAM.
3. Write a report in Google Doc providing the playbook’s code and proof of workability (screenshots or asciicinema recording)
Target platform: any Linux-based distribution
Tools: 
- Ansible [learn here](https://docs.ansible.com/ansible/latest/index.html)
- Utilize PAM authentication module


## Future reading

- [Ansible documentation](https://docs.ansible.com/ansible/latest/index.html)
- Google it!

## Testing

Testing was done on Ubuntu 20.04 AWS EC2 instances.

There are two roles:
 - harden_with_pam that use pwquality package to harden users’ passwords
 - harden_non_pam that use regexp to adjust `/etc/pam.d/common-password` file in order to harden users’ passwords


The results of execution `ansible-playbook playbook.yml` can be found on the asciinema: https://asciinema.org/a/552387

