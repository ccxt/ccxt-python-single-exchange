# __exchangeName__-python
Python SDK (sync and async) for __ExchangeName__ cryptocurrency exchange with Rest and WS capabilities.

You can check the SDK docs here: [SDK](https://docs.ccxt.com/#/exchanges/__exchangeName__)
You can check __ExchangeName__'s docs here: [Docs](__LINK_TO_OFFICIAL_EXCHANGE_DOCS__)


## Installation

```
pip install __PYTHON_PACKAGE_NAME__
```

## Usage

### Sync

```Python
from __exchangeName__ import __ExchangeName__Sync

def main():
    instance = __ExchangeName__Sync({})
    ob =  instance.fetch_order_book("__EXAMPLE_SYMBOL__")
    print(ob)
    #
    # balance = instance.fetch_balance()
    # order = instance.create_order("__EXAMPLE_SYMBOL__", "limit", "buy", 1, 100000)
```

### Async

```Python
import asyncio
from __exchangeName__ import __ExchangeName__Async

async def main():
    instance = __ExchangeName__Async({})
    ob =  await instance.fetch_order_book("__EXAMPLE_SYMBOL__")
    print(ob)
    #
    # balance = await instance.fetch_balance()
    # order = await instance.create_order("__EXAMPLE_SYMBOL__", "limit", "buy", 1, 100000)

asyncio.run(main())
```



### Websockets

```Python
from __exchangeName__ import __ExchangeName__Ws

async def main():
    instance = __ExchangeName__Ws({})
    while True:
        ob = await instance.watch_order_book("__EXAMPLE_SYMBOL__")
        print(ob)
        # orders = await instance.watch_orders("__EXAMPLE_SYMBOL__")
```





#### Raw call

You can also construct custom requests to available "implicit" endpoints

```Python
        request = {
            'type': 'candleSnapshot',
            'req': {
                'coin': coin,
                'interval': tf,
                'startTime': since,
                'endTime': until,
            },
        }
        response = await instance.public_post_info(request)
```



## Contribution
- Give us a star :star:
- Fork and Clone! Awesome
- Select existing issues or create a new issue.