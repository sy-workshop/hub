// PC-TABLE 
    const PC_TABLE_TEMP = document.getElementById("pc_table_temp");
    const PC_TABLE_HUMID = document.getElementById("pc_table_humid");

    smartshop.listen("smartshop/temp", (value) => {
        PC_TABLE_TEMP.innerText = value + "°C";
    });

    smartshop.listen("smartshop/humid", (value) => {
        PC_TABLE_HUMID.innerText = value + "%";
    });

    smartshop.listen_all((value) => {
        console.log(value);
    })
// 