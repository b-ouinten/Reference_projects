/* eslint-disable quotes */
/* eslint-disable react/prop-types */
import './pagesContainer.scss';
import React from 'react';
import { useParams } from 'react-router-dom';
import pagesMap from '../../../consts';

const PagesContainer = () => {
  let { slug } = useParams();
  slug = slug || '';

  const matchedPage = pagesMap[slug];
  const { label, page } = matchedPage;

  return (
    <div className="pagesContainer">
      <h3>{label}</h3>
      <hr />
      <div className="page">
        {page}
      </div>
    </div>
  );
};

export default PagesContainer;
