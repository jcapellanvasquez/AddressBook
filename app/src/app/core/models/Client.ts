import {User} from "./User";
import {Address} from "./Address";


export interface Client {
  id: number;
  name: string;
  email: string;
  active: boolean;
  user: User,
  addressList: Address[]
}
