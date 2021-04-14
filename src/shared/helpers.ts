import { Injectable } from '@nestjs/common';

@Injectable()
export class Helpers {
  public buildError(errors) {
    const result = {};
    errors.forEach((el) => {
      const prop = el.property;
      Object.entries(el.constraints).forEach((constraint) => {
        result[prop + constraint[0]] = `${constraint[1]}`;
      });
    });
    return result;
  }

  public toValidate(metatype): boolean {
    const types = [String, Boolean, Number, Array, Object];
    return !types.find((type) => metatype === type);
  }

  public entriesMapTransformer(response: any) {
      console.log(response);
    const res = {
      time_entries: [],
    };
    response.forEach((element) => {
      if (element.data.time_entry) {
        res.time_entries.push(element.data.time_entry);
      }
    });
    return res;
  }
}
