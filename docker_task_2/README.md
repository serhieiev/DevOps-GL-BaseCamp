## Task 2

1. Prepare private and public network
2. Prepare one dockerfile based on ubuntu with the ping command
3. One container must have access to the private and public networks the second container
must be in the private network
4. A ) Run a container that has access to the public network and ping some resources (
example: google.com )

B ) The second container ping the first container via a private network
5. Report save in GitHub repository

## Solution
- Two networks `private` with `--internal` option and `public` have been created
- Two containers `foo` in a public and `bar` in a private network have been created
- Container `foo` in the public network can ping `google.com` but not able to ping `bar` in the private network
- Container `bar` in the private network can NOT ping `google.com`
- After attaching container `foo` to the `private` network it can ping `google.com` and container `bar` by name or private IP
- The main idea is to demonstrate how Docker networking capabilities can be suitable for the containers isolation 
- The commands execution result is stored in the `output.txt` file