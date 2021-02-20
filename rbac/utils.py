def initMenu(menuListData):
    menuList = []
    for item in menuListData:
        if not item['parent_id']:
            item['children'] = []
            menuList.append(item)
        for menuobj in menuList:
            if menuobj['id'] == item['parent_id']:
                menuobj['children'].append(item)
    return menuList

# def jwt_response_payload_handler(token, user=None, request=None, role=None):
#
#     if user.first_name:
#         name = user.first_name
#     else:
#         name = user.username
#     return {
#         "authenticated": 'true',
#         'id': user.id,
#         "role": role,
#         'name': name,
#         'username': user.username,
#         'email': user.email,
#         'token': token,
#     }