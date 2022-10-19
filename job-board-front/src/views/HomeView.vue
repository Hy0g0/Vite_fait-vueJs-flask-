<template>

  <div class="main">
    <h1 id="maintitle"> Vite Fait </h1>
    <div class='container'>
      
      <div class="container_content">
       
        <div class="container_content_inner">
          <div class="title">
            <h1>Bien Fait</h1>
          </div>
          <div class="par">
            <p>
              Le site qui vous permet de trouver le job idéal. <br>
              Lorem ipsum dolor, sit amet consectetur adipisicing elit. Exercitationem rerum sit blanditiis aut beatae non deserunt error facilis, placeat harum? Tempore perferendis asperiores exercitationem, est voluptatum sed soluta quo sapiente!
            </p>
          </div>
          <div class="btns">
            <RouterLink to="/search-adverts"><button  class='btns_more'>FIND my job</button></RouterLink>
          </div>
        </div>
      </div>
      <div class="container_outer_img">
        <div class="img-inner">
          <img src='../assets/loupe.png' alt="" class="container_img" />
        </div>
      </div>
    </div>
    <div class="overlay"></div>
  </div>
</template>

<script>

export default {
  name: 'Home View'
}
</script>

<style scoped>
#maintitle {
  color: #303245;
  font-size: 100px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  margin-left: 20%;
  animation: expand .8s ease forwards;
  transition: all .8s ease;
}
.main {
  background-color: teal;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  --secondary-color: #303245;
  --contrast-color: teal;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  height: 100%;
  z-index: -10;
  background-color: var(--contrast-color);
}

.container {
  display: flex;
  border-radius: 50px;
  height: 70vh;
  justify-content: space-around;
  align-items: center;
  color: #fff;
  animation: expand .8s ease forwards;
  background-color: var(--secondary-color);
  position: relative;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  transition: all .8s ease;
}

.container_content {
  width: 50%;
}

.container_content_inner {
  width: 80%;
  margin-left: 80px;
}

.container_outer_img {
  margin: 50px;
  width: 50%;
  overflow: hidden;
}

.container_img {
  width: 100%;
  animation: slideIn 1.5s ease-in-out forwards;
}

.par {
  height: auto;
  overflow: hidden;
}

p {
  line-height: 28px;
  transform: translateY(300px);
  animation: slideUp .8s ease-in-out forwards .8s;
}

.btns {
  height: 100%;
  position: relative;
  width: 150px;
  overflow: hidden;
}

.btns_more {
  background: transparent;
  border: 1px solid var(--contrast-color);
  border-radius: 50px;
  padding: 8px 12px;
  color: teal;
  font-size: 16px;
  text-transform: uppercase;
  position: relative;
  margin-top: 15px;
  outline: none;
  transform: translateY(50px);
  animation: slideUp .8s ease-in-out forwards 1s;
}

.title {
  overflow: hidden;
  height: auto;
}

.container h1 {
  font-size: 40px;
  color: var(--contrast-color);
  margin-bottom: 20px;
  transform: translateY(100px);
  animation: slideUp .8s ease forwards .5s;
}

@keyframes slideIn {
  0% {
    transform: translateX(500px) scale(.2);
  }

  100% {
    transform: translateX(0px) scale(1);
  }
}

@keyframes slideUp {
  0% {
    transform: translateY(300px);
  }

  100% {
    transform: translateY(0px);
  }
}

@keyframes expand {
  0% {
    transform: translateX(1400px);
  }

  100% {
    transform: translateX(0px);
  }
}
</style>