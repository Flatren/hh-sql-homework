select vacancy.id, vacancy.title
from response inner join vacancy on response.id_vacancy = vacancy.id
where  (response.click_date - vacancy.public_date) BETWEEN 0 and 7
group by vacancy.id
having count(response.id) > 5
