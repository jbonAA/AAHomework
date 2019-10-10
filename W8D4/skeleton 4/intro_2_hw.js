function title(array, callback) {
    let result = [];

    for(let i = 0; i < array.length; i++){
        let name = array[i][0].toUpperCase();
        let rest = array[i].slice(1).toLowerCase();
        result.push(`${name}` + `${rest}`);
    }
    
    
    
    const res = result.map((el) => callback(el));
    return res;

}

function Elephant(name, height, tricks){
    this.name = name;
    this.height = height;
    this.tricks = [tricks]

    this.trumpet = function() {
        console.log(this.name + ' the elephant goes "phrRRRRRRR!!!"'); 
    }

    this.grow = function() {
        let newh = this.height += 12;
        return `${newh} inches tall`
    }

    this.addTrick = function(trick) {
        this.tricks.push(trick);
    }

    this.play = function() {
        let trikk = this.tricks[Math.random() * this.tricks.length>>0]
        console.log(`${this.name} is ${trikk}`)
    }

    let paradeHelper = function(callback) {
    
    }
}

