import { Console, Command, createSpinner } from 'nestjs-console';
import { HttpService } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as faker from 'faker';

@Console()
export class RedmineSeederService {
  constructor(
    private httpService: HttpService,
    private configService: ConfigService,
  ) {}

  private members: any;

  @Command({
    command: 'redmine-seeder',
    description: 'Seed redmine with a project, members, groups and issues',
  })
  async listContent(): Promise<void> {
    const dbUser = this.configService.get<string>('REDMINE_KEY');
    console.log(faker.name.findName());
    // // See Ora npm package for details about spinner
    // const spin = createSpinner();
    // spin.start(`Listing files in directory ${directory}`);

    // // simulate a long task of 1 seconds
    // const files = await new Promise((done) =>
    //   setTimeout(() => done(['fileA', 'fileB']), 1000),
    // );

    // spin.succeed('Listing done');

    // // send the response to the  cli
    // // you could also use process.stdout.write()
    // console.log(JSON.stringify(files));
  }
}
