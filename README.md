# README

* Ruby version 2.4.0

* Rails version 5.1.4

 * To run the app 
 - rails db:create db:migrat db:seed


 - Task 1 & 2
    <pre>
        class Array
					def khaled_map(&block)
						result = []
						each do |element|
							result << block.call(element)
						end
						result
					end
        end
    </pre>

---------------------
1- 
	http://localhost:3000/api/v1/khaled/articles

out: 
<pre>
{
    "owner_name": "khaled",
    "articles": [
        {
            "id": 1,
            "name": "The Other Side of Silence",
            "price": "26$",
            "description": "Terreo aspernatur valetudo. Crinis varius beatae complectus alii paulatim. Super arma accipio abutor absconditus adeo."
        },
        {
            "id": 2,
            "name": "Many Waters",
            "price": "14$",
            "description": "Textor tabgo constans curis tandem cursim viscus canto. Ultra capillus error audentia adversus."
        },
        {
            "id": 3,
            "name": "The Stars' Tennis Balls",
            "price": "64$",
            "description": "Utroque itaque caritas. Adeo aetas pauci. Bestia velut volup assumenda subseco eveniet depopulo. Vulnus acsi templum adeo sapiente solitudo voco."
        }
    ]
}
</pre>

------------

2- http://localhost:3000/api/v1/articles/1
output:
<pre>
{
    "owner_name": "khaled",
    "id": 1,
    "name": "The Other Side of Silence",
    "price": "26$",
    "description": "Terreo aspernatur valetudo. Crinis varius beatae complectus alii paulatim. Super arma accipio abutor absconditus adeo."
}
</pre> 

3- http://localhost:3000/api/v1/owners?params[length]=10&params[offset]=20&params[order_mode]=ASC

output:
<pre>
{
    "owners": [
        {
            "name": "khaled"
        },
        {
            "name": "Kiana"
        },
        {
            "name": "Aiden"
        },
        {
            "name": "Isaiah"
        },
        {
            "name": "Berenice"
        },
        {
            "name": "Morris"
        }
    ]
}
</pre>

4- http://localhost:3000/api/v1/khaled

<pre>
{
    "name": "khaled"
}
</pre>
