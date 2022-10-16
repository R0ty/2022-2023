const apri_url = "https://networkcalc.com/api/ip/{subnet}"

async   function getUser() {

    const response = await fetch(apri_url);
    const data = await response.json();
    console.log(data.results);

    const user = data.results[0];
    let {subnet_mask, subnet_bits, wildcard_mask} = user.mask;
    let {network_address, broadcast_address} = user.address;
    let {assignable_host, first_assignable_host,last_assignable_host} = user.host
    
    document.getElementById("getIp") 
}