# Javascript refresher

**Synchronous programming**

1. Put popcorn in microwave
2. Wait for popcorn to finish
3. Pour drinks for everyone

- Isn't it weird to wait for the popcorn to finish, when you could have spent that time pouring people drinks? That's what async programming allows.
- Async programming allows us to do something without having to wait for something else to finish

**Asynchronous programming**

1. Put popcorn in microwave
2. Pour drinks for everyone
3. Wait for popcorn to finish

- Now, if step 3 instead was _Put salt on popcorn_ then you would want to wait for step 2 to finish first, and async would not make sense.
- How this works is through a **promise** that the function in step 1 would give us.
  - Those promises can be either Pending, Fulfilled or Rejected.

**Let's do the above with pseudo code**

- We need to do three things:
  - Cook popcorn
  - Pour drinks
  - Start movie

**This would be synchronous:**

```javascript
function setupMoveNight() {
  cookPopcorn(); // first do this
  pourDrinks(); // then do this
  startMovie(); // and finally do this
}
```

**While this would be asynchronous:**

```javascript
async function setupMoveNight() {
  await cookPopcorn();
  await pourDrinks();
  startMovie();
}

function cookPopcorn() {
  // some code
  return Promise(/*some more code here*/);
}
```

- By using async functions we get access to the **await** keyword.
- When using await we're telling any promise-based function to wait for that promise to be fulfilled (i.e. the promise in my cookPopcorn function), or rejected.
- So in the async function above, we're saying, first run cookPopcorn(), then run pourDrinks() and only if those two are Fulfilled, run startMovie().

**Anonymous functions**
TBD
