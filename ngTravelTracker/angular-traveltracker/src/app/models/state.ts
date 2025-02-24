import { User } from "./user";

export class State {

    id: number;
    name: string;
    user : User;

    constructor(id: number = 0, name: string = '', user: User = new User()){
        this.id = id;
        this.name = name;
        this.user = user;
    }
}
