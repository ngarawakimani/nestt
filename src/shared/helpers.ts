import { Injectable } from '@nestjs/common';

@Injectable()
export class Helpers {
  /**
   * Helper to build response errors
   *
   * @param {Object} errors
   * @returns {Object}
   */
  public buildError(errors): any {
    const result = {};
    errors.forEach((el) => {
      const prop = el.property;
      Object.entries(el.constraints).forEach((constraint) => {
        result[prop + constraint[0]] = `${constraint[1]}`;
      });
    });
    return result;
  }

  /**
   * Check validation types
   *
   * @param {Object} metatype
   * @returns {Boolean}
   */
  public toValidate(metatype): boolean {
    const types = [String, Boolean, Number, Array, Object];
    return !types.find((type) => metatype === type);
  }

  /**
   * Transform entries
   *
   * @param {Object} response
   * @returns {Object}
   */
  public entriesMapTransformer(response: any): any {
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
