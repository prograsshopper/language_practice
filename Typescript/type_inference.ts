let car = {
    brand: "BMW",
    engine: 3.4,
    run: function(){
        console.log("driving at 100 miles an hour")
    }
}

car.brand = "Merecedes";
// car.brand = 3.5 --> 에러 발생

let car_name: string;
let engine: number;
let isFast: boolean;

car_name = "BMW";
engine = 5.4;
isFast = true;


function cal(val1:number, val2:number): number{
    let total: number = val1 + val2;
    return total;
}
cal(2, 2);


let vehicle: {brand: string, engineType: number} = {
    brand: "Merecedes",
    engineType: 4.6
}

let unionType: number | string;