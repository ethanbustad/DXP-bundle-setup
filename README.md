# Liferay DXP Interaction Scripts

* To set up a bundle locally:
  * Create a `variables-ext.sh` file to override variables in `variables.sh` that aren't accurate for your environment
  * (Other files should generally work without edits)
  * Run `set_up_bundle.sh`
* To kick off a jenkins job to test a pull request, run `python test_pr.py $github_url`

## `set_up_bundle.sh`

Details should be filled in here at some point.

## `test_pr.py`

### First Invocation

The first time the script is run, it will prompt for the following information:

* Master Key: This will not be stored anywhere, but will be used to encrypt/decrypt the other passwords entered.
* GitHub Username: GitHub credentials are required to be able to retrieve the necessary PR info via the GitHub API.
* GitHub Password: This can either be your regular password or a personal access token. It will be stored encrypted in .credentials/github
  * To generate a personal access token, go to menu in upper right > Settings > Developer Settings > Personal access tokens > Generate new token
  * Using an API token is generally preferred as it can be more conveniently revoked, and provides a much more limited set of permissions (reducing the scope of potential damage), in the case of it becoming compromised.
* Jenkins Username: Jenkins credentials are required to be able to start a new build in Jenkins.
* Jenkins Password: This can either be your regular password or a personal access token. It will be stored encrypted in .credentials/jenkins
  * Personal access tokens are automatically generated for all users on our Jenkins server. To find yours, go to menu in upper right > Configure > API Token > Show API Token...
  * Using an API token is generally preferred as it can be more conveniently revoked in the case of it becoming compromised, and especially so with our current setup as HTTPS is not yet supported by our CI server, and we use Basic Authentication (so your credentials are sent obfuscated but not encrypted)

### Subsequent Invocations

Future invocations of the script will only prompt for the Master Key. If the Master Key is entered incorrectly, the system passwords will not be decrypted correctly, so you will receive a 401 error when the script attempts access. If you suspect you've entered your Master Key in wrong (or if decryption has _ever_ been successful, but now fails), kill the script at this point (`ctrl-c`) and rerun it. If instead you had a typo in your Master Key the first time you entered it, or even just feel like changing it, continue and re-enter your system credentials when prompted.

This may be improved in the future by validating the decryption was performed successfully, but only if it can be guaranteed that this doesn't open up an attack vector on the encryption scheme.

### System Requirements

The script currently requires Python 2.7+, and does not support Python 3. This can be fixed if the need arises. (Python 3 support has partially been added, but some more tricky cases have not been addressed.)

The script also requires the pycrypto library to be installed. This comes installed by default in some systems, but not in others. The script will fail if the dependency isn't met. In this case, follow the provided instructions to remedy the situation.

### Limitations

The GitHub API only allows 60 requests per hour (for me at least). Your allowance can be checked at [https://api.github.com/rate_limit](https://api.github.com/rate_limit). The script calls the GitHub API once per invocation.