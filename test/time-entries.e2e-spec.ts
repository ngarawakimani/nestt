import * as request from 'supertest';
import { Test } from '@nestjs/testing';
import { TimeEntriesModule } from '../src/time-entries/time-entries.module';
import { INestApplication } from '@nestjs/common';

describe('Time Entries', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      imports: [TimeEntriesModule],
    }).compile();

    app = moduleRef.createNestApplication();
    await app.init();
  });

  it(`/GET Projects`, (done) => {
    return request(app.getHttpServer())
      .get('/time-entries/projects')
      .expect('Content-Type', /json/)
      .expect(200)
      .then((response) => {
        expect(response.body.projects[0].name).toBe(
          'Koopango Devops infrastracture',
        );
        done();
      })
      .catch((err) => done(err));
  });

  it(`/GET Users`, (done) => {
    return request(app.getHttpServer())
      .get('/time-entries/users')
      .expect('Content-Type', /json/)
      .expect(200)
      .then((response) => {
        expect(response.body.group.users[0].name).toBe('Dancan Kimani');
        done();
      })
      .catch((err) => done(err));
  });

  afterAll(async () => {
    await app.close();
  });
});
