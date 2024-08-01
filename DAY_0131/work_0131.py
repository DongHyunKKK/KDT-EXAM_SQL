def my_sort(dict, idx):
    if idx == '1':
        i = 1
        for key, value in world.items():
            value2 = value.copy()
            value2[2] = int(value[2].replace(',', ''))
            print(f'[{i}] {key} : {value2}')
            i += 1
    elif idx == '2':
        i = 1
        sort_list = sorted(world.values(), key=lambda s: s[0])
        for info in sort_list:
            for key, value in world.items():
                if value == info:
                    print(f'[{i}] {key} : {world[key][0]}  {world[key][1]}  {world[key][2]}')
            i += 1
    elif idx == '3':
        i = 1
        sort_list = sorted(world.values(), key = lambda s : int(s[2].replace(',','')), reverse = True)
        for info in sort_list:
            for key, value in world.items():
                if value == info:
                    print(f'[{i}] {key} : {world[key][2]}')
            i += 1
    elif idx == '4':
        city = input('출력할 도시 이름을 입력하세요 : ')
        if city not in world.keys():
            print(f'도시이름 : {city}는 key에 없습니다.')
        else:
            print(f'국가 : {world[city][0]}, 대륙 : {world[city][1]}, 인구수 : {world[city][2]}')
    elif idx == '5':
        conti_name = input('대륙 이름을 입력하세요(Asia, Europe, America) : ')
        sum = 0
        for i in range(6):
            if conti_name in list(world.values())[i]:
                print(f'{list(world.keys())[i]} : {list(world.values())[i][2]}')
                sum += int(list(world.values())[i][2].replace(',', ''))
        print(f'{conti_name} 전체 인구수 : {sum:,}')
    else:
        print('잘못된 입력입니다. 다시 입력해주세요.')


world = {'Seoul': ['South Korea', 'Asia', '9,655,000'],
         'Tokyo': ['Japan', 'Asia', '14,110,000'],
         'Beijing': ['China', 'Asia', '21,540,000'],
         'London': ['United Kingdom', 'Europe', '14,800,000'],
         'Berlin': ['Germany', 'Europe', '3,426,000'],
         'Mexico City': ['Mexico', 'America', '21,200,000']}

while True:

    print('-' * 50)
    print('1. 전체 데이터 출력')
    print('2. 수도 이름 오름차순 출력')
    print('3. 모든 도시의 인구수 내림차순 출력')
    print('4. 특정 도시의 정보 출력')
    print('5. 대륙별 인구수 계산 및 출력')
    print('6. 프로그램 종료')
    print('-' * 50)
    idx = input('메뉴를 입력하세요 : ')

    if idx == '6':
        print('프로그램을 종료합니다.')
        break
    else:
        my_sort(world, idx)