#菜单结构化
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

