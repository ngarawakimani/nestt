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

  it(`Get all projects`, (done) => {
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

  it(`Get all users in the "software" team group`, (done) => {
    return request(app.getHttpServer())
      .get('/time-entries/users')
      .expect('Content-Type', /json/)
      .expect(200)
      .then((response) => {
        expect(response.body.group.name).toBe('Software Team');
        done();
      })
      .catch((err) => done(err));
  });

  it(`Get all issues on projects`, (done) => {
    return request(app.getHttpServer())
      .get('/time-entries/issues')
      .expect('Content-Type', /json/)
      .expect(200)
      .then((response) => {
        expect(typeof response.body.issues).toBe('object');
        done();
      })
      .catch((err) => done(err));
  });

  it(`Make a time entry of a user per project`, (done) => {
    return request(app.getHttpServer())
      .post('/time-entries/time-entry-of-user-per-project')
      .send({
        projectId: 1,
        spentOn: '2021-04-14',
        hours: 1,
        comments:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        userId: 6,
      })
      .expect('Content-Type', /json/)
      .expect(201)
      .then((response) => {
        expect(typeof response.body.time_entry).toBe('object');
        done();
      })
      .catch((err) => done(err));
  });

  it(`Make time entries of a user per project`, (done) => {
    return request(app.getHttpServer())
      .post('/time-entries/time-entries-of-user-per-project')
      .send({
        projectId: 1,
        entries: [
          {
            spentOn: '2021-04-15',
            hours: 2,
            comments:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          },
        ],
        userId: 6,
      })
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(201)
      .then((response) => {
        expect(typeof response.body.time_entries).toBe('object');
        done();
      })
      .catch((err) => done(err));
  });

  it(`Make time entries of a user in multiple projects`, (done) => {
    return request(app.getHttpServer())
      .post('/time-entries/time-entries-of-user-multi-projects')
      .send({
        entries: [
          {
            projectId: 1,
            spentOn: '2021-04-15',
            hours: 2,
            comments:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          },
        ],
        userId: 6,
      })
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(201)
      .then((response) => {
        expect(typeof response.body.time_entries).toBe('object');
        done();
      })
      .catch((err) => done(err));
  });

  it(`Make time entries of users in a project`, (done) => {
    return request(app.getHttpServer())
      .post('/time-entries/time-entries-of-users-per-project')
      .send({
        projectId: 1,
        entries: [
          {
            userId: 6,
            spentOn: '2021-04-15',
            hours: 2,
            comments:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          },
        ],
      })
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(201)
      .then((response) => {
        expect(typeof response.body.time_entries).toBe('object');
        done();
      })
      .catch((err) => done(err));
  });

  afterAll(async () => {
    await app.close();
  });
});
