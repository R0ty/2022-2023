const IpC = {
    data() {
        return {
            ip : "",
            data: {}

        }
    },
    methods: {
        getUser() {
            this.ip = document.getElementById('getIp').value
            fetch("https://networkcalc.com/api/ip/192.168.1.1/24").then((response)=> response.json()).then((data)=>this.data = data.address);
        }

    },
};
Vue.createApp(IpC).mount('.container');