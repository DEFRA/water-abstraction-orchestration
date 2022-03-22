export PERMIT_URI=http://host.docker.internal:8004/API/1.0/
export CRM_URI=http://host.docker.internal:8002/crm/1.0
export RETURNS_URI=http://host.docker.internal:8006/returns/1.0
export CHARGE_MODULE_ORIGIN=http://host.docker.internal:3005
export EA_ADDRESS_FACADE_URI=http://host.docker.internal:9002
export DATABASE_URL=postgres://water_user:password@host.docker.internal:5432/permits
export REDIS_HOST=host.docker.internal
# Missing from shared variables ?
export IDM_URI=http://host.docker.internal:8003/idm/1.0