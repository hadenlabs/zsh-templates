## Title Release

Description

### Parameters

```
| Value         | Description     | example  |
| ------------- | :-------------: | -------- |
| store_name    | name of store   | store    |
| new_version   | version         | 0.12.0   |
```

### Deployment

#### Settings Release

```
git flow release start {{new_version}}
make ansible.decrypt store={{store_name}}
```

**edit provision/ansible/{{store_name}}/vars/vars.yaml**

```
application_tag: {{new_version}}
```

```
make ansible.encrypt store={{store_name}}
bumpversion minor
bumplus -v {{new_version}}
edit CHANGELOG.rst and add tasks and fix
git add .
git commit -m "Add: new version {{new_version}}"
git flow release finish {{new_version}}
make release.update
make ansible.tag tags=deploy_code store={{store_name}}
```

#### Execute scripts in server

```
cd infrastructure/
pyenv activate {{store_name}}
pip install -r requirements.txt
sudo supervisorctl reload all
sudo service nginx reload
```

### FrontEnd

### QA
