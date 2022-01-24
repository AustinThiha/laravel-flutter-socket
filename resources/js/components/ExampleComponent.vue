<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">Chat App</div>

          <!-- <div class="card-body">Hello Moblile Dev~</div> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    console.log("Component mounted.");
    let channel = window.Echo.channel("send_message");
    channel.listenToAll((e) => {
      console.log("Listen all process : " + e);
    });
    let i = true;
    window.Echo.channel("send_message").listen(".SendMessage", (e) => {
      console.log(e);
      // axios
      //   .post("http://127.0.0.1:8000/api/send_message", {
      //     userID: "ID",
      //     message: "HEllo",
      //   })
      //   .then(
      //     (response) => {
      //       console.log(response);
      //     },
      //     (error) => {
      //       console.log(error);
      //     }
      //   );
    });
  },
};
</script>
