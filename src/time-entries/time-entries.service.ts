import { Injectable, HttpService } from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable()
export class TimeEntriesService {
  constructor(private httpService: HttpService) {}

  async getProjects(): Promise<Observable<any>> {
    return await this.httpService
      .get(`projects.json`)
      .pipe(map((response) => response.data));
  }

  async getUsers(): Promise<Observable<any>> {
    return await this.httpService
      .get(`groups/12.json?include=users`)
      .pipe(map((response) => response.data));
  }

  async getIssues(): Promise<Observable<any>> {
    return await this.httpService
      .get(`issues.json`)
      .pipe(map((response) => response.data));
  }

  async singleUserPerProject(data: any): Promise<Observable<any>> {
    const payload = {
      project_id: data.projectId,
      spent_on: data.spentOn,
      hours: data.hours,
      comments: data.projectId,
      user_id: data.userId,
    };
    return await this.httpService
      .post(`time_entries.json`, payload);
  }

  async singleUserMultipleProjects(): Promise<Observable<any>> {
    return await this.httpService
      .get(`groups/12.json?include=users`)
      .pipe(map((response) => response.data));
  }

  async usersPerProject(): Promise<Observable<any>> {
    return await this.httpService
      .get(`groups/12.json?include=users`)
      .pipe(map((response) => response.data));
  }
}
