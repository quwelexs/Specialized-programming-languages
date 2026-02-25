
% МІНІ-ЕКСПЕРТНА СИСТЕМА: ПІДБІР МОБІЛЬНОГО ТАРИФУ
% Опис основних предикатів (Словник бази знань):
% 1. client(Name, Budget) - описує клієнта та його максимальний бюджет на місяць.
% 2. usage_profile(Name, UsedMins, UsedGB, NeedsRoaming) - профіль використання: 
%    скільки хвилин і ГБ потрібно клієнту, та чи потрібен йому роумінг (yes/no).
% 3. tariff(Id, MaxMins, MaxGB, HasRoaming, Price) - каталог тарифів.
%    (значення 9999 використовується як аналог "безліміту").
% 4. recommended_tariff(Client, TariffId) - головний предикат бізнес-логіки.
% 5. all_recommended_tariffs(Client, List) - предикат агрегації через findall/3.
% 6. advise_tariff_for(Client) - зручний інтерфейс для користувача.

%задання 2, база фактів
%клієнти(ім'я, бюджет у грн)
client(oleg, 150).
client(anna, 200).
client(ivan, 150).
client(maria, 400).
client(dmytro, 1000).
client(olena, 250).
client(student_max, 100).

%профілі використання(ім'я, потрібні хвилини, потрібні гб, чи потрібен роумінг)
usage_profile(oleg, 80, 3, no).%скромний користувач
usage_profile(anna, 20, 15, no).%любить інтернет, мало дзвонить
usage_profile(ivan, 800, 1, no).%багато дзвонить, інтернет майже не потрібен
usage_profile(maria, 400, 8, yes).%потрібен роумінг для поїздок
usage_profile(dmytro, 2000, 100, yes).%vip юхер
usage_profile(olena, 40, 50, no).%активний серфінг, перегляд відео
usage_profile(student_max, 500, 50, no).%хоче багато, але бюджет лише 100 грн

%тарифи(назва, хвилини, гб, роумінг, ціна)
tariff(basic, 100, 5, no, 100).
tariff(internet_light, 50, 20, no, 150).
tariff(talker, 1000, 2, no, 120).
tariff(internet_pro, 100, 9999, no, 220).%9999 типу безліміту
tariff(traveler, 500, 10, yes, 300).
tariff(vip_unlimited, 9999, 9999, yes, 500).


%завдання 3, правила еспертної сисиетми

%1 перевірка достатності хвилин
check_mins(TariffMins, UsedMins) :- 
    TariffMins >= UsedMins.

%2 перевірка достатності гігабайтів
check_gb(TariffGB, UsedGB) :- 
    TariffGB >= UsedGB.

%3-4 логіка підбору роумінгу
%якщо клієнт вимагає роумінг (yes), тариф теж має його підтримувати (yes)
check_roaming(yes, yes).
%якщо клієнту роумінг не потрібен (no), то підійде будь-який тариф
check_roaming(no, _). 

%5 комбіноване правило "тех. сумісність"
%бізнес-логіка: "якщо клієнт використовує певну кількість хвилин, гб та вимагає/не вимагає роумінг, то тариф повинен мати не менші ліміти 
%та підтримувати необхідний роумінг".
% 
% Джерела параметрів:
%-З фактів: параметри профілю (UsedMins, UsedGB, NeedsRoaming) беруться з факту usage_profile/4. Ліміти (TariffMins, TariffGB, TariffRoaming) - з факту tariff/5.
%-З інших правил: перевірки здійснюються допоміжними правилами  check_mins/2, check_gb/2, check_roaming/2.
%тариф технічно підходить клієнту, якщо задовольняє всі потреби його профілю
strict_match(Client, Tariff) :-
    usage_profile(Client, UsedMins, UsedGB, NeedsRoaming),
    tariff(Tariff, TariffMins, TariffGB, TariffRoaming, _),
    check_mins(TariffMins, UsedMins),
    check_gb(TariffGB, UsedGB),
    check_roaming(NeedsRoaming, TariffRoaming).

%6 фінальна рекомендація
%бізнес-логіка: "якщо тариф технічно підходить клієнту (strict_match) і при цьому його ціна не перевищує місячний бюджет клієнта, то ми 
%рекомендуємо цей тариф"
%джерела параметрів:
%-З фактів: budgt береться з факту client/2, price - з факту tariff/5
%-З інших правил: технічна відповідність береться з правила strict_match/2
recommended_tariff(Client, Tariff) :-
    strict_match(Client, Tariff),
    client(Client, Budget),
    tariff(Tariff, _, _, _, Price),
    Price =< Budget.

%6 негативна відповідь
%бізнес-логіка: "якщо для клієнта не існує жодного тарифу, який би одночасно підходив технічно і вписувався в бюджет, ТО система повертає 
%значення 'no_matching_tariff'".
%якщо жоден тариф не покриває потреби клієнта за його гроші
%\+ , для збоїв і т.д
recommended_tariff(Client, no_matching_tariff) :-
    client(Client, Budget),
    \+ (strict_match(Client, T), tariff(T, _, _, _, P), P =< Budget).


%завдання 3, findfall

%всі траифи які підходять клієнту в список
all_recommended_tariffs(Client, TariffList) :-
    findall(Tariff, 
            recommended_tariff(Client, Tariff), 
            TariffList).

%всі кліжнти, яким підходить тариф
clients_for_tariff(Tariff, ClientList) :-
    findall(Client, 
            recommended_tariff(Client, Tariff), 
            ClientList).


%завдання 5, інтерфейс

%верхньорівневий предикат для зручного запиту користувача
%він сам знаходить список, форматує його і виводить на екран
advise_tariff_for(Client) :-
    all_recommended_tariffs(Client, List),
    write('EXPERT SYSTEM'), nl,
    write('Client: '), write(Client), nl,
    write('Recommended tariffs: '), write(List), nl.