def test_file_exists(host):
    wikijs = host.file('/wikijs.yml')
    assert wikijs.exists
    assert wikijs.contains('your')

# def test_wikijs_is_installed(host):
#     wikijs = host.package('wikijs')
#     assert wikijs.is_installed
#
#
# def test_user_and_group_exist(host):
#     user = host.user('wikijs')
#     assert user.group == 'wikijs'
#     assert user.home == '/var/lib/wikijs'
#
#
# def test_service_is_running_and_enabled(host):
#     wikijs = host.service('wikijs')
#     assert wikijs.is_enabled
#     assert wikijs.is_running
