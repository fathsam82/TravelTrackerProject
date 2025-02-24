export class User {
    id: number;
    username: string;
    email: string;
    password: string;
    enabled: boolean;

    constructor(id: number = 0, username: string = '', email: string = '', password: string = '', enabled: boolean = false, role: string = ''
    ) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.enabled = enabled;
    }

}
